(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v11)
             (pred_5 ?v1 ?v2)
             (pred_9 ?v4 ?v2)
             (pred_7 ?v6 ?v4 )
	     (pred_11 ?v4)
             (pred_12 ?v7)
             (pred_6 ?v1)
             (pred_4 ?v2)
             (pred_8 ?v4)
             (pred_2 ?v1)
             (pred_1 ?v4)
             (pred_3 ))



(:action op_4
:parameters (?v13 ?v9 ?v3 ?v5)
:precondition (and (pred_12 ?v13) (pred_12 ?v9) (pred_6 ?v3) (pred_4 ?v5)
          (pred_10 ?v13 ?v9) (pred_5 ?v3 ?v5)
                   (pred_9 ?v9 ?v5) (pred_11 ?v13) 
                   (pred_8 ?v9) (pred_2 ?v3))
:effect (and  (pred_1 ?v9) (not (pred_8 ?v9))))


(:action op_3
:parameters (?v13 ?v8)
:precondition (and (pred_12 ?v13) (pred_12 ?v8)
               (pred_11 ?v13) (pred_10 ?v13 ?v8) (pred_1 ?v8))
:effect (and (pred_11 ?v8) (not (pred_11 ?v13))))

(:action op_2
:parameters (?v13 ?v3)
:precondition (and (pred_12 ?v13) (pred_6 ?v3) 
                  (pred_11 ?v13) (pred_7 ?v3 ?v13) (pred_3 ))
:effect (and (pred_2 ?v3)
   (not (pred_7 ?v3 ?v13)) (not (pred_3 ))))


(:action op_1
:parameters (?v13 ?v10 ?v12)
:precondition (and (pred_12 ?v13) (pred_6 ?v10) (pred_6 ?v12)
                  (pred_11 ?v13) (pred_2 ?v12) (pred_7 ?v10 ?v13))
:effect (and (pred_2 ?v10) (pred_7 ?v12 ?v13)
        (not (pred_2 ?v12)) (not (pred_7 ?v10 ?v13))))

(:action op_5
:parameters (?v13 ?v3)
:precondition (and (pred_12 ?v13) (pred_6 ?v3) 
                  (pred_11 ?v13) (pred_2 ?v3))
:effect (and (pred_3 ) (pred_7 ?v3 ?v13) (not (pred_2 ?v3)))))


	

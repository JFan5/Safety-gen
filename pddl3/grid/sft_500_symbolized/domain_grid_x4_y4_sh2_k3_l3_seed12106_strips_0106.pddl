(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v4)
             (pred_12 ?v2 ?v3)
             (pred_1 ?v5 ?v3)
             (pred_5 ?v11 ?v5 )
	     (pred_7 ?v5)
             (pred_6 ?v1)
             (pred_3 ?v2)
             (pred_8 ?v3)
             (pred_2 ?v5)
             (pred_4 ?v2)
             (pred_10 ?v5)
             (pred_9 ))



(:action op_4
:parameters (?v13 ?v9 ?v8 ?v6)
:precondition (and (pred_6 ?v13) (pred_6 ?v9) (pred_3 ?v8) (pred_8 ?v6)
          (pred_11 ?v13 ?v9) (pred_12 ?v8 ?v6)
                   (pred_1 ?v9 ?v6) (pred_7 ?v13) 
                   (pred_2 ?v9) (pred_4 ?v8))
:effect (and  (pred_10 ?v9) (not (pred_2 ?v9))))


(:action op_3
:parameters (?v13 ?v12)
:precondition (and (pred_6 ?v13) (pred_6 ?v12)
               (pred_7 ?v13) (pred_11 ?v13 ?v12) (pred_10 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v13))))

(:action op_5
:parameters (?v13 ?v8)
:precondition (and (pred_6 ?v13) (pred_3 ?v8) 
                  (pred_7 ?v13) (pred_5 ?v8 ?v13) (pred_9 ))
:effect (and (pred_4 ?v8)
   (not (pred_5 ?v8 ?v13)) (not (pred_9 ))))


(:action op_1
:parameters (?v13 ?v10 ?v7)
:precondition (and (pred_6 ?v13) (pred_3 ?v10) (pred_3 ?v7)
                  (pred_7 ?v13) (pred_4 ?v7) (pred_5 ?v10 ?v13))
:effect (and (pred_4 ?v10) (pred_5 ?v7 ?v13)
        (not (pred_4 ?v7)) (not (pred_5 ?v10 ?v13))))

(:action op_2
:parameters (?v13 ?v8)
:precondition (and (pred_6 ?v13) (pred_3 ?v8) 
                  (pred_7 ?v13) (pred_4 ?v8))
:effect (and (pred_9 ) (pred_5 ?v8 ?v13) (not (pred_4 ?v8)))))


	

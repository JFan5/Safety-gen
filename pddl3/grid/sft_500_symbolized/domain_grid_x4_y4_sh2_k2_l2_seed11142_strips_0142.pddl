(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v12 ?v4)
             (pred_12 ?v10 ?v7)
             (pred_2 ?v12 ?v7)
             (pred_7 ?v3 ?v12 )
	     (pred_4 ?v12)
             (pred_5 ?v6)
             (pred_6 ?v10)
             (pred_10 ?v7)
             (pred_11 ?v12)
             (pred_1 ?v10)
             (pred_9 ?v12)
             (pred_8 ))



(:action op_1
:parameters (?v13 ?v1 ?v5 ?v11)
:precondition (and (pred_5 ?v13) (pred_5 ?v1) (pred_6 ?v5) (pred_10 ?v11)
          (pred_3 ?v13 ?v1) (pred_12 ?v5 ?v11)
                   (pred_2 ?v1 ?v11) (pred_4 ?v13) 
                   (pred_11 ?v1) (pred_1 ?v5))
:effect (and  (pred_9 ?v1) (not (pred_11 ?v1))))


(:action op_2
:parameters (?v13 ?v9)
:precondition (and (pred_5 ?v13) (pred_5 ?v9)
               (pred_4 ?v13) (pred_3 ?v13 ?v9) (pred_9 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v13))))

(:action op_5
:parameters (?v13 ?v5)
:precondition (and (pred_5 ?v13) (pred_6 ?v5) 
                  (pred_4 ?v13) (pred_7 ?v5 ?v13) (pred_8 ))
:effect (and (pred_1 ?v5)
   (not (pred_7 ?v5 ?v13)) (not (pred_8 ))))


(:action op_3
:parameters (?v13 ?v8 ?v2)
:precondition (and (pred_5 ?v13) (pred_6 ?v8) (pred_6 ?v2)
                  (pred_4 ?v13) (pred_1 ?v2) (pred_7 ?v8 ?v13))
:effect (and (pred_1 ?v8) (pred_7 ?v2 ?v13)
        (not (pred_1 ?v2)) (not (pred_7 ?v8 ?v13))))

(:action op_4
:parameters (?v13 ?v5)
:precondition (and (pred_5 ?v13) (pred_6 ?v5) 
                  (pred_4 ?v13) (pred_1 ?v5))
:effect (and (pred_8 ) (pred_7 ?v5 ?v13) (not (pred_1 ?v5)))))


	

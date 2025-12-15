(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v10 ?v6)
             (pred_4 ?v12 ?v9)
             (pred_11 ?v10 ?v9)
             (pred_7 ?v7 ?v10 )
	     (pred_3 ?v10)
             (pred_12 ?v1)
             (pred_2 ?v12)
             (pred_9 ?v9)
             (pred_1 ?v10)
             (pred_5 ?v12)
             (pred_6 ?v10)
             (pred_8 ))



(:action op_1
:parameters (?v13 ?v2 ?v3 ?v4)
:precondition (and (pred_12 ?v13) (pred_12 ?v2) (pred_2 ?v3) (pred_9 ?v4)
          (pred_10 ?v13 ?v2) (pred_4 ?v3 ?v4)
                   (pred_11 ?v2 ?v4) (pred_3 ?v13) 
                   (pred_1 ?v2) (pred_5 ?v3))
:effect (and  (pred_6 ?v2) (not (pred_1 ?v2))))


(:action op_5
:parameters (?v13 ?v5)
:precondition (and (pred_12 ?v13) (pred_12 ?v5)
               (pred_3 ?v13) (pred_10 ?v13 ?v5) (pred_6 ?v5))
:effect (and (pred_3 ?v5) (not (pred_3 ?v13))))

(:action op_3
:parameters (?v13 ?v3)
:precondition (and (pred_12 ?v13) (pred_2 ?v3) 
                  (pred_3 ?v13) (pred_7 ?v3 ?v13) (pred_8 ))
:effect (and (pred_5 ?v3)
   (not (pred_7 ?v3 ?v13)) (not (pred_8 ))))


(:action op_2
:parameters (?v13 ?v8 ?v11)
:precondition (and (pred_12 ?v13) (pred_2 ?v8) (pred_2 ?v11)
                  (pred_3 ?v13) (pred_5 ?v11) (pred_7 ?v8 ?v13))
:effect (and (pred_5 ?v8) (pred_7 ?v11 ?v13)
        (not (pred_5 ?v11)) (not (pred_7 ?v8 ?v13))))

(:action op_4
:parameters (?v13 ?v3)
:precondition (and (pred_12 ?v13) (pred_2 ?v3) 
                  (pred_3 ?v13) (pred_5 ?v3))
:effect (and (pred_8 ) (pred_7 ?v3 ?v13) (not (pred_5 ?v3)))))


	

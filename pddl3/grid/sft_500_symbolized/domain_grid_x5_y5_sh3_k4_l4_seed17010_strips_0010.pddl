(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v10 ?v6)
             (pred_5 ?v1 ?v4)
             (pred_2 ?v10 ?v4)
             (pred_1 ?v8 ?v10 )
	     (pred_6 ?v10)
             (pred_11 ?v9)
             (pred_9 ?v1)
             (pred_8 ?v4)
             (pred_12 ?v10)
             (pred_7 ?v1)
             (pred_10 ?v10)
             (pred_4 ))



(:action op_3
:parameters (?v3 ?v7 ?v5 ?v12)
:precondition (and (pred_11 ?v3) (pred_11 ?v7) (pred_9 ?v5) (pred_8 ?v12)
          (pred_3 ?v3 ?v7) (pred_5 ?v5 ?v12)
                   (pred_2 ?v7 ?v12) (pred_6 ?v3) 
                   (pred_12 ?v7) (pred_7 ?v5))
:effect (and  (pred_10 ?v7) (not (pred_12 ?v7))))


(:action op_2
:parameters (?v3 ?v13)
:precondition (and (pred_11 ?v3) (pred_11 ?v13)
               (pred_6 ?v3) (pred_3 ?v3 ?v13) (pred_10 ?v13))
:effect (and (pred_6 ?v13) (not (pred_6 ?v3))))

(:action op_4
:parameters (?v3 ?v5)
:precondition (and (pred_11 ?v3) (pred_9 ?v5) 
                  (pred_6 ?v3) (pred_1 ?v5 ?v3) (pred_4 ))
:effect (and (pred_7 ?v5)
   (not (pred_1 ?v5 ?v3)) (not (pred_4 ))))


(:action op_1
:parameters (?v3 ?v2 ?v11)
:precondition (and (pred_11 ?v3) (pred_9 ?v2) (pred_9 ?v11)
                  (pred_6 ?v3) (pred_7 ?v11) (pred_1 ?v2 ?v3))
:effect (and (pred_7 ?v2) (pred_1 ?v11 ?v3)
        (not (pred_7 ?v11)) (not (pred_1 ?v2 ?v3))))

(:action op_5
:parameters (?v3 ?v5)
:precondition (and (pred_11 ?v3) (pred_9 ?v5) 
                  (pred_6 ?v3) (pred_7 ?v5))
:effect (and (pred_4 ) (pred_1 ?v5 ?v3) (not (pred_7 ?v5)))))


	

(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v8 ?v5)
             (pred_8 ?v10 ?v6)
             (pred_2 ?v8 ?v6)
             (pred_3 ?v11 ?v8 )
	     (pred_10 ?v8)
             (pred_12 ?v9)
             (pred_7 ?v10)
             (pred_1 ?v6)
             (pred_11 ?v8)
             (pred_4 ?v10)
             (pred_9 ?v8)
             (pred_5 ))



(:action op_5
:parameters (?v7 ?v2 ?v13 ?v4)
:precondition (and (pred_12 ?v7) (pred_12 ?v2) (pred_7 ?v13) (pred_1 ?v4)
          (pred_6 ?v7 ?v2) (pred_8 ?v13 ?v4)
                   (pred_2 ?v2 ?v4) (pred_10 ?v7) 
                   (pred_11 ?v2) (pred_4 ?v13))
:effect (and  (pred_9 ?v2) (not (pred_11 ?v2))))


(:action op_1
:parameters (?v7 ?v1)
:precondition (and (pred_12 ?v7) (pred_12 ?v1)
               (pred_10 ?v7) (pred_6 ?v7 ?v1) (pred_9 ?v1))
:effect (and (pred_10 ?v1) (not (pred_10 ?v7))))

(:action op_2
:parameters (?v7 ?v13)
:precondition (and (pred_12 ?v7) (pred_7 ?v13) 
                  (pred_10 ?v7) (pred_3 ?v13 ?v7) (pred_5 ))
:effect (and (pred_4 ?v13)
   (not (pred_3 ?v13 ?v7)) (not (pred_5 ))))


(:action op_4
:parameters (?v7 ?v3 ?v12)
:precondition (and (pred_12 ?v7) (pred_7 ?v3) (pred_7 ?v12)
                  (pred_10 ?v7) (pred_4 ?v12) (pred_3 ?v3 ?v7))
:effect (and (pred_4 ?v3) (pred_3 ?v12 ?v7)
        (not (pred_4 ?v12)) (not (pred_3 ?v3 ?v7))))

(:action op_3
:parameters (?v7 ?v13)
:precondition (and (pred_12 ?v7) (pred_7 ?v13) 
                  (pred_10 ?v7) (pred_4 ?v13))
:effect (and (pred_5 ) (pred_3 ?v13 ?v7) (not (pred_4 ?v13)))))


	

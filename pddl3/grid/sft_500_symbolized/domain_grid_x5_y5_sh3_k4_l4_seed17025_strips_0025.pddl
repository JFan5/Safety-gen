(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v3)
             (pred_5 ?v6 ?v11)
             (pred_4 ?v9 ?v11)
             (pred_2 ?v5 ?v9 )
	     (pred_12 ?v9)
             (pred_8 ?v10)
             (pred_10 ?v6)
             (pred_6 ?v11)
             (pred_3 ?v9)
             (pred_1 ?v6)
             (pred_9 ?v9)
             (pred_7 ))



(:action op_3
:parameters (?v7 ?v8 ?v13 ?v2)
:precondition (and (pred_8 ?v7) (pred_8 ?v8) (pred_10 ?v13) (pred_6 ?v2)
          (pred_11 ?v7 ?v8) (pred_5 ?v13 ?v2)
                   (pred_4 ?v8 ?v2) (pred_12 ?v7) 
                   (pred_3 ?v8) (pred_1 ?v13))
:effect (and  (pred_9 ?v8) (not (pred_3 ?v8))))


(:action op_2
:parameters (?v7 ?v12)
:precondition (and (pred_8 ?v7) (pred_8 ?v12)
               (pred_12 ?v7) (pred_11 ?v7 ?v12) (pred_9 ?v12))
:effect (and (pred_12 ?v12) (not (pred_12 ?v7))))

(:action op_5
:parameters (?v7 ?v13)
:precondition (and (pred_8 ?v7) (pred_10 ?v13) 
                  (pred_12 ?v7) (pred_2 ?v13 ?v7) (pred_7 ))
:effect (and (pred_1 ?v13)
   (not (pred_2 ?v13 ?v7)) (not (pred_7 ))))


(:action op_1
:parameters (?v7 ?v1 ?v4)
:precondition (and (pred_8 ?v7) (pred_10 ?v1) (pred_10 ?v4)
                  (pred_12 ?v7) (pred_1 ?v4) (pred_2 ?v1 ?v7))
:effect (and (pred_1 ?v1) (pred_2 ?v4 ?v7)
        (not (pred_1 ?v4)) (not (pred_2 ?v1 ?v7))))

(:action op_4
:parameters (?v7 ?v13)
:precondition (and (pred_8 ?v7) (pred_10 ?v13) 
                  (pred_12 ?v7) (pred_1 ?v13))
:effect (and (pred_7 ) (pred_2 ?v13 ?v7) (not (pred_1 ?v13)))))


	

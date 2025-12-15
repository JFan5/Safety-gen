(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v4 ?v12)
             (pred_11 ?v9 ?v13)
             (pred_1 ?v4 ?v13)
             (pred_12 ?v8 ?v4 )
	     (pred_5 ?v4)
             (pred_8 ?v10)
             (pred_10 ?v9)
             (pred_2 ?v13)
             (pred_7 ?v4)
             (pred_3 ?v9)
             (pred_9 ?v4)
             (pred_4 ))



(:action op_2
:parameters (?v7 ?v5 ?v11 ?v6)
:precondition (and (pred_8 ?v7) (pred_8 ?v5) (pred_10 ?v11) (pred_2 ?v6)
          (pred_6 ?v7 ?v5) (pred_11 ?v11 ?v6)
                   (pred_1 ?v5 ?v6) (pred_5 ?v7) 
                   (pred_7 ?v5) (pred_3 ?v11))
:effect (and  (pred_9 ?v5) (not (pred_7 ?v5))))


(:action op_1
:parameters (?v7 ?v2)
:precondition (and (pred_8 ?v7) (pred_8 ?v2)
               (pred_5 ?v7) (pred_6 ?v7 ?v2) (pred_9 ?v2))
:effect (and (pred_5 ?v2) (not (pred_5 ?v7))))

(:action op_5
:parameters (?v7 ?v11)
:precondition (and (pred_8 ?v7) (pred_10 ?v11) 
                  (pred_5 ?v7) (pred_12 ?v11 ?v7) (pred_4 ))
:effect (and (pred_3 ?v11)
   (not (pred_12 ?v11 ?v7)) (not (pred_4 ))))


(:action op_3
:parameters (?v7 ?v1 ?v3)
:precondition (and (pred_8 ?v7) (pred_10 ?v1) (pred_10 ?v3)
                  (pred_5 ?v7) (pred_3 ?v3) (pred_12 ?v1 ?v7))
:effect (and (pred_3 ?v1) (pred_12 ?v3 ?v7)
        (not (pred_3 ?v3)) (not (pred_12 ?v1 ?v7))))

(:action op_4
:parameters (?v7 ?v11)
:precondition (and (pred_8 ?v7) (pred_10 ?v11) 
                  (pred_5 ?v7) (pred_3 ?v11))
:effect (and (pred_4 ) (pred_12 ?v11 ?v7) (not (pred_3 ?v11)))))


	

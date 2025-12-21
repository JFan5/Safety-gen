(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v13 ?v6)
             (pred_5 ?v3 ?v1)
             (pred_4 ?v13 ?v1)
             (pred_11 ?v12 ?v13 )
	     (pred_6 ?v13)
             (pred_1 ?v8)
             (pred_3 ?v3)
             (pred_12 ?v1)
             (pred_2 ?v13)
             (pred_10 ?v3)
             (pred_8 ?v13)
             (pred_7 ))



(:action op_1
:parameters (?v7 ?v10 ?v4 ?v9)
:precondition (and (pred_1 ?v7) (pred_1 ?v10) (pred_3 ?v4) (pred_12 ?v9)
          (pred_9 ?v7 ?v10) (pred_5 ?v4 ?v9)
                   (pred_4 ?v10 ?v9) (pred_6 ?v7) 
                   (pred_2 ?v10) (pred_10 ?v4))
:effect (and  (pred_8 ?v10) (not (pred_2 ?v10))))


(:action op_5
:parameters (?v7 ?v11)
:precondition (and (pred_1 ?v7) (pred_1 ?v11)
               (pred_6 ?v7) (pred_9 ?v7 ?v11) (pred_8 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v7))))

(:action op_4
:parameters (?v7 ?v4)
:precondition (and (pred_1 ?v7) (pred_3 ?v4) 
                  (pred_6 ?v7) (pred_11 ?v4 ?v7) (pred_7 ))
:effect (and (pred_10 ?v4)
   (not (pred_11 ?v4 ?v7)) (not (pred_7 ))))


(:action op_3
:parameters (?v7 ?v5 ?v2)
:precondition (and (pred_1 ?v7) (pred_3 ?v5) (pred_3 ?v2)
                  (pred_6 ?v7) (pred_10 ?v2) (pred_11 ?v5 ?v7))
:effect (and (pred_10 ?v5) (pred_11 ?v2 ?v7)
        (not (pred_10 ?v2)) (not (pred_11 ?v5 ?v7))))

(:action op_2
:parameters (?v7 ?v4)
:precondition (and (pred_1 ?v7) (pred_3 ?v4) 
                  (pred_6 ?v7) (pred_10 ?v4))
:effect (and (pred_7 ) (pred_11 ?v4 ?v7) (not (pred_10 ?v4)))))


	

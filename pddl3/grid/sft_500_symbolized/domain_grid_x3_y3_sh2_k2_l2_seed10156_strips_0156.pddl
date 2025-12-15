(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v9 ?v12)
             (pred_3 ?v13 ?v1)
             (pred_7 ?v9 ?v1)
             (pred_10 ?v6 ?v9 )
	     (pred_12 ?v9)
             (pred_8 ?v10)
             (pred_11 ?v13)
             (pred_2 ?v1)
             (pred_1 ?v9)
             (pred_6 ?v13)
             (pred_9 ?v9)
             (pred_4 ))



(:action op_2
:parameters (?v7 ?v8 ?v4 ?v5)
:precondition (and (pred_8 ?v7) (pred_8 ?v8) (pred_11 ?v4) (pred_2 ?v5)
          (pred_5 ?v7 ?v8) (pred_3 ?v4 ?v5)
                   (pred_7 ?v8 ?v5) (pred_12 ?v7) 
                   (pred_1 ?v8) (pred_6 ?v4))
:effect (and  (pred_9 ?v8) (not (pred_1 ?v8))))


(:action op_5
:parameters (?v7 ?v3)
:precondition (and (pred_8 ?v7) (pred_8 ?v3)
               (pred_12 ?v7) (pred_5 ?v7 ?v3) (pred_9 ?v3))
:effect (and (pred_12 ?v3) (not (pred_12 ?v7))))

(:action op_4
:parameters (?v7 ?v4)
:precondition (and (pred_8 ?v7) (pred_11 ?v4) 
                  (pred_12 ?v7) (pred_10 ?v4 ?v7) (pred_4 ))
:effect (and (pred_6 ?v4)
   (not (pred_10 ?v4 ?v7)) (not (pred_4 ))))


(:action op_3
:parameters (?v7 ?v11 ?v2)
:precondition (and (pred_8 ?v7) (pred_11 ?v11) (pred_11 ?v2)
                  (pred_12 ?v7) (pred_6 ?v2) (pred_10 ?v11 ?v7))
:effect (and (pred_6 ?v11) (pred_10 ?v2 ?v7)
        (not (pred_6 ?v2)) (not (pred_10 ?v11 ?v7))))

(:action op_1
:parameters (?v7 ?v4)
:precondition (and (pred_8 ?v7) (pred_11 ?v4) 
                  (pred_12 ?v7) (pred_6 ?v4))
:effect (and (pred_4 ) (pred_10 ?v4 ?v7) (not (pred_6 ?v4)))))


	

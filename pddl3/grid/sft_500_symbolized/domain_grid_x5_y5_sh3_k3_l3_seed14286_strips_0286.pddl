(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v6 ?v12)
             (pred_5 ?v1 ?v9)
             (pred_9 ?v6 ?v9)
             (pred_7 ?v5 ?v6 )
	     (pred_10 ?v6)
             (pred_12 ?v13)
             (pred_2 ?v1)
             (pred_3 ?v9)
             (pred_11 ?v6)
             (pred_6 ?v1)
             (pred_1 ?v6)
             (pred_8 ))



(:action op_3
:parameters (?v7 ?v4 ?v8 ?v2)
:precondition (and (pred_12 ?v7) (pred_12 ?v4) (pred_2 ?v8) (pred_3 ?v2)
          (pred_4 ?v7 ?v4) (pred_5 ?v8 ?v2)
                   (pred_9 ?v4 ?v2) (pred_10 ?v7) 
                   (pred_11 ?v4) (pred_6 ?v8))
:effect (and  (pred_1 ?v4) (not (pred_11 ?v4))))


(:action op_5
:parameters (?v7 ?v3)
:precondition (and (pred_12 ?v7) (pred_12 ?v3)
               (pred_10 ?v7) (pred_4 ?v7 ?v3) (pred_1 ?v3))
:effect (and (pred_10 ?v3) (not (pred_10 ?v7))))

(:action op_2
:parameters (?v7 ?v8)
:precondition (and (pred_12 ?v7) (pred_2 ?v8) 
                  (pred_10 ?v7) (pred_7 ?v8 ?v7) (pred_8 ))
:effect (and (pred_6 ?v8)
   (not (pred_7 ?v8 ?v7)) (not (pred_8 ))))


(:action op_4
:parameters (?v7 ?v11 ?v10)
:precondition (and (pred_12 ?v7) (pred_2 ?v11) (pred_2 ?v10)
                  (pred_10 ?v7) (pred_6 ?v10) (pred_7 ?v11 ?v7))
:effect (and (pred_6 ?v11) (pred_7 ?v10 ?v7)
        (not (pred_6 ?v10)) (not (pred_7 ?v11 ?v7))))

(:action op_1
:parameters (?v7 ?v8)
:precondition (and (pred_12 ?v7) (pred_2 ?v8) 
                  (pred_10 ?v7) (pred_6 ?v8))
:effect (and (pred_8 ) (pred_7 ?v8 ?v7) (not (pred_6 ?v8)))))


	

(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v8 ?v11)
             (pred_11 ?v4 ?v13)
             (pred_10 ?v8 ?v13)
             (pred_7 ?v10 ?v8 )
	     (pred_5 ?v8)
             (pred_8 ?v3)
             (pred_6 ?v4)
             (pred_9 ?v13)
             (pred_4 ?v8)
             (pred_1 ?v4)
             (pred_2 ?v8)
             (pred_3 ))



(:action op_4
:parameters (?v2 ?v12 ?v6 ?v1)
:precondition (and (pred_8 ?v2) (pred_8 ?v12) (pred_6 ?v6) (pred_9 ?v1)
          (pred_12 ?v2 ?v12) (pred_11 ?v6 ?v1)
                   (pred_10 ?v12 ?v1) (pred_5 ?v2) 
                   (pred_4 ?v12) (pred_1 ?v6))
:effect (and  (pred_2 ?v12) (not (pred_4 ?v12))))


(:action op_1
:parameters (?v2 ?v7)
:precondition (and (pred_8 ?v2) (pred_8 ?v7)
               (pred_5 ?v2) (pred_12 ?v2 ?v7) (pred_2 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v2))))

(:action op_3
:parameters (?v2 ?v6)
:precondition (and (pred_8 ?v2) (pred_6 ?v6) 
                  (pred_5 ?v2) (pred_7 ?v6 ?v2) (pred_3 ))
:effect (and (pred_1 ?v6)
   (not (pred_7 ?v6 ?v2)) (not (pred_3 ))))


(:action op_5
:parameters (?v2 ?v9 ?v5)
:precondition (and (pred_8 ?v2) (pred_6 ?v9) (pred_6 ?v5)
                  (pred_5 ?v2) (pred_1 ?v5) (pred_7 ?v9 ?v2))
:effect (and (pred_1 ?v9) (pred_7 ?v5 ?v2)
        (not (pred_1 ?v5)) (not (pred_7 ?v9 ?v2))))

(:action op_2
:parameters (?v2 ?v6)
:precondition (and (pred_8 ?v2) (pred_6 ?v6) 
                  (pred_5 ?v2) (pred_1 ?v6))
:effect (and (pred_3 ) (pred_7 ?v6 ?v2) (not (pred_1 ?v6)))))


	

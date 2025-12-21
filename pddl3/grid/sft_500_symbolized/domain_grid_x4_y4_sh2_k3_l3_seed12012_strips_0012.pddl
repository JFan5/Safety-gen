(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v5 ?v10)
             (pred_8 ?v9 ?v13)
             (pred_5 ?v5 ?v13)
             (pred_6 ?v4 ?v5 )
	     (pred_11 ?v5)
             (pred_1 ?v7)
             (pred_9 ?v9)
             (pred_4 ?v13)
             (pred_12 ?v5)
             (pred_10 ?v9)
             (pred_7 ?v5)
             (pred_2 ))



(:action op_2
:parameters (?v11 ?v12 ?v3 ?v6)
:precondition (and (pred_1 ?v11) (pred_1 ?v12) (pred_9 ?v3) (pred_4 ?v6)
          (pred_3 ?v11 ?v12) (pred_8 ?v3 ?v6)
                   (pred_5 ?v12 ?v6) (pred_11 ?v11) 
                   (pred_12 ?v12) (pred_10 ?v3))
:effect (and  (pred_7 ?v12) (not (pred_12 ?v12))))


(:action op_1
:parameters (?v11 ?v2)
:precondition (and (pred_1 ?v11) (pred_1 ?v2)
               (pred_11 ?v11) (pred_3 ?v11 ?v2) (pred_7 ?v2))
:effect (and (pred_11 ?v2) (not (pred_11 ?v11))))

(:action op_3
:parameters (?v11 ?v3)
:precondition (and (pred_1 ?v11) (pred_9 ?v3) 
                  (pred_11 ?v11) (pred_6 ?v3 ?v11) (pred_2 ))
:effect (and (pred_10 ?v3)
   (not (pred_6 ?v3 ?v11)) (not (pred_2 ))))


(:action op_5
:parameters (?v11 ?v1 ?v8)
:precondition (and (pred_1 ?v11) (pred_9 ?v1) (pred_9 ?v8)
                  (pred_11 ?v11) (pred_10 ?v8) (pred_6 ?v1 ?v11))
:effect (and (pred_10 ?v1) (pred_6 ?v8 ?v11)
        (not (pred_10 ?v8)) (not (pred_6 ?v1 ?v11))))

(:action op_4
:parameters (?v11 ?v3)
:precondition (and (pred_1 ?v11) (pred_9 ?v3) 
                  (pred_11 ?v11) (pred_10 ?v3))
:effect (and (pred_2 ) (pred_6 ?v3 ?v11) (not (pred_10 ?v3)))))


	

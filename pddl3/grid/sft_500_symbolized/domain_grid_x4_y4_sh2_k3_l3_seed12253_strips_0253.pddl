(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v1 ?v9)
             (pred_6 ?v12 ?v13)
             (pred_8 ?v1 ?v13)
             (pred_9 ?v3 ?v1 )
	     (pred_1 ?v1)
             (pred_7 ?v10)
             (pred_5 ?v12)
             (pred_2 ?v13)
             (pred_3 ?v1)
             (pred_12 ?v12)
             (pred_4 ?v1)
             (pred_10 ))



(:action op_5
:parameters (?v11 ?v4 ?v6 ?v8)
:precondition (and (pred_7 ?v11) (pred_7 ?v4) (pred_5 ?v6) (pred_2 ?v8)
          (pred_11 ?v11 ?v4) (pred_6 ?v6 ?v8)
                   (pred_8 ?v4 ?v8) (pred_1 ?v11) 
                   (pred_3 ?v4) (pred_12 ?v6))
:effect (and  (pred_4 ?v4) (not (pred_3 ?v4))))


(:action op_3
:parameters (?v11 ?v7)
:precondition (and (pred_7 ?v11) (pred_7 ?v7)
               (pred_1 ?v11) (pred_11 ?v11 ?v7) (pred_4 ?v7))
:effect (and (pred_1 ?v7) (not (pred_1 ?v11))))

(:action op_1
:parameters (?v11 ?v6)
:precondition (and (pred_7 ?v11) (pred_5 ?v6) 
                  (pred_1 ?v11) (pred_9 ?v6 ?v11) (pred_10 ))
:effect (and (pred_12 ?v6)
   (not (pred_9 ?v6 ?v11)) (not (pred_10 ))))


(:action op_2
:parameters (?v11 ?v5 ?v2)
:precondition (and (pred_7 ?v11) (pred_5 ?v5) (pred_5 ?v2)
                  (pred_1 ?v11) (pred_12 ?v2) (pred_9 ?v5 ?v11))
:effect (and (pred_12 ?v5) (pred_9 ?v2 ?v11)
        (not (pred_12 ?v2)) (not (pred_9 ?v5 ?v11))))

(:action op_4
:parameters (?v11 ?v6)
:precondition (and (pred_7 ?v11) (pred_5 ?v6) 
                  (pred_1 ?v11) (pred_12 ?v6))
:effect (and (pred_10 ) (pred_9 ?v6 ?v11) (not (pred_12 ?v6)))))


	

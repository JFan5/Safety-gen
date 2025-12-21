(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v3)
             (pred_12 ?v10 ?v7)
             (pred_4 ?v5 ?v7)
             (pred_7 ?v13 ?v5 )
	     (pred_2 ?v5)
             (pred_9 ?v9)
             (pred_5 ?v10)
             (pred_8 ?v7)
             (pred_1 ?v5)
             (pred_10 ?v10)
             (pred_11 ?v5)
             (pred_3 ))



(:action op_1
:parameters (?v11 ?v8 ?v6 ?v1)
:precondition (and (pred_9 ?v11) (pred_9 ?v8) (pred_5 ?v6) (pred_8 ?v1)
          (pred_6 ?v11 ?v8) (pred_12 ?v6 ?v1)
                   (pred_4 ?v8 ?v1) (pred_2 ?v11) 
                   (pred_1 ?v8) (pred_10 ?v6))
:effect (and  (pred_11 ?v8) (not (pred_1 ?v8))))


(:action op_5
:parameters (?v11 ?v4)
:precondition (and (pred_9 ?v11) (pred_9 ?v4)
               (pred_2 ?v11) (pred_6 ?v11 ?v4) (pred_11 ?v4))
:effect (and (pred_2 ?v4) (not (pred_2 ?v11))))

(:action op_4
:parameters (?v11 ?v6)
:precondition (and (pred_9 ?v11) (pred_5 ?v6) 
                  (pred_2 ?v11) (pred_7 ?v6 ?v11) (pred_3 ))
:effect (and (pred_10 ?v6)
   (not (pred_7 ?v6 ?v11)) (not (pred_3 ))))


(:action op_2
:parameters (?v11 ?v2 ?v12)
:precondition (and (pred_9 ?v11) (pred_5 ?v2) (pred_5 ?v12)
                  (pred_2 ?v11) (pred_10 ?v12) (pred_7 ?v2 ?v11))
:effect (and (pred_10 ?v2) (pred_7 ?v12 ?v11)
        (not (pred_10 ?v12)) (not (pred_7 ?v2 ?v11))))

(:action op_3
:parameters (?v11 ?v6)
:precondition (and (pred_9 ?v11) (pred_5 ?v6) 
                  (pred_2 ?v11) (pred_10 ?v6))
:effect (and (pred_3 ) (pred_7 ?v6 ?v11) (not (pred_10 ?v6)))))


	

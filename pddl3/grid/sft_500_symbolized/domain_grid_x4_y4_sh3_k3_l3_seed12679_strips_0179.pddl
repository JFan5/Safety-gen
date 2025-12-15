(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v7 ?v3)
             (pred_6 ?v9 ?v13)
             (pred_1 ?v7 ?v13)
             (pred_3 ?v10 ?v7 )
	     (pred_5 ?v7)
             (pred_2 ?v8)
             (pred_9 ?v9)
             (pred_4 ?v13)
             (pred_7 ?v7)
             (pred_10 ?v9)
             (pred_11 ?v7)
             (pred_12 ))



(:action op_2
:parameters (?v11 ?v12 ?v6 ?v2)
:precondition (and (pred_2 ?v11) (pred_2 ?v12) (pred_9 ?v6) (pred_4 ?v2)
          (pred_8 ?v11 ?v12) (pred_6 ?v6 ?v2)
                   (pred_1 ?v12 ?v2) (pred_5 ?v11) 
                   (pred_7 ?v12) (pred_10 ?v6))
:effect (and  (pred_11 ?v12) (not (pred_7 ?v12))))


(:action op_1
:parameters (?v11 ?v4)
:precondition (and (pred_2 ?v11) (pred_2 ?v4)
               (pred_5 ?v11) (pred_8 ?v11 ?v4) (pred_11 ?v4))
:effect (and (pred_5 ?v4) (not (pred_5 ?v11))))

(:action op_5
:parameters (?v11 ?v6)
:precondition (and (pred_2 ?v11) (pred_9 ?v6) 
                  (pred_5 ?v11) (pred_3 ?v6 ?v11) (pred_12 ))
:effect (and (pred_10 ?v6)
   (not (pred_3 ?v6 ?v11)) (not (pred_12 ))))


(:action op_4
:parameters (?v11 ?v5 ?v1)
:precondition (and (pred_2 ?v11) (pred_9 ?v5) (pred_9 ?v1)
                  (pred_5 ?v11) (pred_10 ?v1) (pred_3 ?v5 ?v11))
:effect (and (pred_10 ?v5) (pred_3 ?v1 ?v11)
        (not (pred_10 ?v1)) (not (pred_3 ?v5 ?v11))))

(:action op_3
:parameters (?v11 ?v6)
:precondition (and (pred_2 ?v11) (pred_9 ?v6) 
                  (pred_5 ?v11) (pred_10 ?v6))
:effect (and (pred_12 ) (pred_3 ?v6 ?v11) (not (pred_10 ?v6)))))


	

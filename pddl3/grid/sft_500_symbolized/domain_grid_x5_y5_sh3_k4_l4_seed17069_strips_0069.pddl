(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v7 ?v3)
             (pred_11 ?v4 ?v10)
             (pred_4 ?v7 ?v10)
             (pred_10 ?v9 ?v7 )
	     (pred_5 ?v7)
             (pred_3 ?v1)
             (pred_6 ?v4)
             (pred_12 ?v10)
             (pred_8 ?v7)
             (pred_2 ?v4)
             (pred_9 ?v7)
             (pred_1 ))



(:action op_5
:parameters (?v11 ?v6 ?v5 ?v13)
:precondition (and (pred_3 ?v11) (pred_3 ?v6) (pred_6 ?v5) (pred_12 ?v13)
          (pred_7 ?v11 ?v6) (pred_11 ?v5 ?v13)
                   (pred_4 ?v6 ?v13) (pred_5 ?v11) 
                   (pred_8 ?v6) (pred_2 ?v5))
:effect (and  (pred_9 ?v6) (not (pred_8 ?v6))))


(:action op_2
:parameters (?v11 ?v12)
:precondition (and (pred_3 ?v11) (pred_3 ?v12)
               (pred_5 ?v11) (pred_7 ?v11 ?v12) (pred_9 ?v12))
:effect (and (pred_5 ?v12) (not (pred_5 ?v11))))

(:action op_4
:parameters (?v11 ?v5)
:precondition (and (pred_3 ?v11) (pred_6 ?v5) 
                  (pred_5 ?v11) (pred_10 ?v5 ?v11) (pred_1 ))
:effect (and (pred_2 ?v5)
   (not (pred_10 ?v5 ?v11)) (not (pred_1 ))))


(:action op_1
:parameters (?v11 ?v2 ?v8)
:precondition (and (pred_3 ?v11) (pred_6 ?v2) (pred_6 ?v8)
                  (pred_5 ?v11) (pred_2 ?v8) (pred_10 ?v2 ?v11))
:effect (and (pred_2 ?v2) (pred_10 ?v8 ?v11)
        (not (pred_2 ?v8)) (not (pred_10 ?v2 ?v11))))

(:action op_3
:parameters (?v11 ?v5)
:precondition (and (pred_3 ?v11) (pred_6 ?v5) 
                  (pred_5 ?v11) (pred_2 ?v5))
:effect (and (pred_1 ) (pred_10 ?v5 ?v11) (not (pred_2 ?v5)))))


	

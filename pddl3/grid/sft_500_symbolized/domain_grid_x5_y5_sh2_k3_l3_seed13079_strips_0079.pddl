(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v1 ?v12)
             (pred_2 ?v10 ?v13)
             (pred_7 ?v1 ?v13)
             (pred_11 ?v9 ?v1 )
	     (pred_9 ?v1)
             (pred_5 ?v8)
             (pred_8 ?v10)
             (pred_3 ?v13)
             (pred_6 ?v1)
             (pred_12 ?v10)
             (pred_1 ?v1)
             (pred_4 ))



(:action op_5
:parameters (?v6 ?v11 ?v7 ?v4)
:precondition (and (pred_5 ?v6) (pred_5 ?v11) (pred_8 ?v7) (pred_3 ?v4)
          (pred_10 ?v6 ?v11) (pred_2 ?v7 ?v4)
                   (pred_7 ?v11 ?v4) (pred_9 ?v6) 
                   (pred_6 ?v11) (pred_12 ?v7))
:effect (and  (pred_1 ?v11) (not (pred_6 ?v11))))


(:action op_2
:parameters (?v6 ?v2)
:precondition (and (pred_5 ?v6) (pred_5 ?v2)
               (pred_9 ?v6) (pred_10 ?v6 ?v2) (pred_1 ?v2))
:effect (and (pred_9 ?v2) (not (pred_9 ?v6))))

(:action op_1
:parameters (?v6 ?v7)
:precondition (and (pred_5 ?v6) (pred_8 ?v7) 
                  (pred_9 ?v6) (pred_11 ?v7 ?v6) (pred_4 ))
:effect (and (pred_12 ?v7)
   (not (pred_11 ?v7 ?v6)) (not (pred_4 ))))


(:action op_4
:parameters (?v6 ?v3 ?v5)
:precondition (and (pred_5 ?v6) (pred_8 ?v3) (pred_8 ?v5)
                  (pred_9 ?v6) (pred_12 ?v5) (pred_11 ?v3 ?v6))
:effect (and (pred_12 ?v3) (pred_11 ?v5 ?v6)
        (not (pred_12 ?v5)) (not (pred_11 ?v3 ?v6))))

(:action op_3
:parameters (?v6 ?v7)
:precondition (and (pred_5 ?v6) (pred_8 ?v7) 
                  (pred_9 ?v6) (pred_12 ?v7))
:effect (and (pred_4 ) (pred_11 ?v7 ?v6) (not (pred_12 ?v7)))))


	

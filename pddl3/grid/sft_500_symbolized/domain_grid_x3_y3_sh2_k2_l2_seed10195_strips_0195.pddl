(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v5 ?v12)
             (pred_12 ?v1 ?v7)
             (pred_6 ?v5 ?v7)
             (pred_1 ?v10 ?v5 )
	     (pred_10 ?v5)
             (pred_7 ?v11)
             (pred_3 ?v1)
             (pred_5 ?v7)
             (pred_11 ?v5)
             (pred_4 ?v1)
             (pred_2 ?v5)
             (pred_9 ))



(:action op_1
:parameters (?v6 ?v3 ?v2 ?v13)
:precondition (and (pred_7 ?v6) (pred_7 ?v3) (pred_3 ?v2) (pred_5 ?v13)
          (pred_8 ?v6 ?v3) (pred_12 ?v2 ?v13)
                   (pred_6 ?v3 ?v13) (pred_10 ?v6) 
                   (pred_11 ?v3) (pred_4 ?v2))
:effect (and  (pred_2 ?v3) (not (pred_11 ?v3))))


(:action op_3
:parameters (?v6 ?v4)
:precondition (and (pred_7 ?v6) (pred_7 ?v4)
               (pred_10 ?v6) (pred_8 ?v6 ?v4) (pred_2 ?v4))
:effect (and (pred_10 ?v4) (not (pred_10 ?v6))))

(:action op_5
:parameters (?v6 ?v2)
:precondition (and (pred_7 ?v6) (pred_3 ?v2) 
                  (pred_10 ?v6) (pred_1 ?v2 ?v6) (pred_9 ))
:effect (and (pred_4 ?v2)
   (not (pred_1 ?v2 ?v6)) (not (pred_9 ))))


(:action op_4
:parameters (?v6 ?v9 ?v8)
:precondition (and (pred_7 ?v6) (pred_3 ?v9) (pred_3 ?v8)
                  (pred_10 ?v6) (pred_4 ?v8) (pred_1 ?v9 ?v6))
:effect (and (pred_4 ?v9) (pred_1 ?v8 ?v6)
        (not (pred_4 ?v8)) (not (pred_1 ?v9 ?v6))))

(:action op_2
:parameters (?v6 ?v2)
:precondition (and (pred_7 ?v6) (pred_3 ?v2) 
                  (pred_10 ?v6) (pred_4 ?v2))
:effect (and (pred_9 ) (pred_1 ?v2 ?v6) (not (pred_4 ?v2)))))


	

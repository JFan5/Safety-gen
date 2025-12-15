(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v13 ?v7)
             (pred_8 ?v12 ?v9)
             (pred_4 ?v13 ?v9)
             (pred_5 ?v1 ?v13 )
	     (pred_3 ?v13)
             (pred_11 ?v8)
             (pred_12 ?v12)
             (pred_7 ?v9)
             (pred_1 ?v13)
             (pred_6 ?v12)
             (pred_10 ?v13)
             (pred_2 ))



(:action op_5
:parameters (?v6 ?v3 ?v4 ?v5)
:precondition (and (pred_11 ?v6) (pred_11 ?v3) (pred_12 ?v4) (pred_7 ?v5)
          (pred_9 ?v6 ?v3) (pred_8 ?v4 ?v5)
                   (pred_4 ?v3 ?v5) (pred_3 ?v6) 
                   (pred_1 ?v3) (pred_6 ?v4))
:effect (and  (pred_10 ?v3) (not (pred_1 ?v3))))


(:action op_1
:parameters (?v6 ?v2)
:precondition (and (pred_11 ?v6) (pred_11 ?v2)
               (pred_3 ?v6) (pred_9 ?v6 ?v2) (pred_10 ?v2))
:effect (and (pred_3 ?v2) (not (pred_3 ?v6))))

(:action op_2
:parameters (?v6 ?v4)
:precondition (and (pred_11 ?v6) (pred_12 ?v4) 
                  (pred_3 ?v6) (pred_5 ?v4 ?v6) (pred_2 ))
:effect (and (pred_6 ?v4)
   (not (pred_5 ?v4 ?v6)) (not (pred_2 ))))


(:action op_3
:parameters (?v6 ?v11 ?v10)
:precondition (and (pred_11 ?v6) (pred_12 ?v11) (pred_12 ?v10)
                  (pred_3 ?v6) (pred_6 ?v10) (pred_5 ?v11 ?v6))
:effect (and (pred_6 ?v11) (pred_5 ?v10 ?v6)
        (not (pred_6 ?v10)) (not (pred_5 ?v11 ?v6))))

(:action op_4
:parameters (?v6 ?v4)
:precondition (and (pred_11 ?v6) (pred_12 ?v4) 
                  (pred_3 ?v6) (pred_6 ?v4))
:effect (and (pred_2 ) (pred_5 ?v4 ?v6) (not (pred_6 ?v4)))))


	

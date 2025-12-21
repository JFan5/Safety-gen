(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v13 ?v4)
             (pred_9 ?v9 ?v12)
             (pred_4 ?v13 ?v12)
             (pred_1 ?v8 ?v13 )
	     (pred_11 ?v13)
             (pred_7 ?v7)
             (pred_8 ?v9)
             (pred_12 ?v12)
             (pred_3 ?v13)
             (pred_5 ?v9)
             (pred_2 ?v13)
             (pred_10 ))



(:action op_4
:parameters (?v6 ?v3 ?v2 ?v11)
:precondition (and (pred_7 ?v6) (pred_7 ?v3) (pred_8 ?v2) (pred_12 ?v11)
          (pred_6 ?v6 ?v3) (pred_9 ?v2 ?v11)
                   (pred_4 ?v3 ?v11) (pred_11 ?v6) 
                   (pred_3 ?v3) (pred_5 ?v2))
:effect (and  (pred_2 ?v3) (not (pred_3 ?v3))))


(:action op_1
:parameters (?v6 ?v1)
:precondition (and (pred_7 ?v6) (pred_7 ?v1)
               (pred_11 ?v6) (pred_6 ?v6 ?v1) (pred_2 ?v1))
:effect (and (pred_11 ?v1) (not (pred_11 ?v6))))

(:action op_3
:parameters (?v6 ?v2)
:precondition (and (pred_7 ?v6) (pred_8 ?v2) 
                  (pred_11 ?v6) (pred_1 ?v2 ?v6) (pred_10 ))
:effect (and (pred_5 ?v2)
   (not (pred_1 ?v2 ?v6)) (not (pred_10 ))))


(:action op_5
:parameters (?v6 ?v5 ?v10)
:precondition (and (pred_7 ?v6) (pred_8 ?v5) (pred_8 ?v10)
                  (pred_11 ?v6) (pred_5 ?v10) (pred_1 ?v5 ?v6))
:effect (and (pred_5 ?v5) (pred_1 ?v10 ?v6)
        (not (pred_5 ?v10)) (not (pred_1 ?v5 ?v6))))

(:action op_2
:parameters (?v6 ?v2)
:precondition (and (pred_7 ?v6) (pred_8 ?v2) 
                  (pred_11 ?v6) (pred_5 ?v2))
:effect (and (pred_10 ) (pred_1 ?v2 ?v6) (not (pred_5 ?v2)))))


	

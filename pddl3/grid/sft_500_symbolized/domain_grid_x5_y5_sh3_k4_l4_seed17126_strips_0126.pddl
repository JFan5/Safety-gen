(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v7 ?v13)
             (pred_9 ?v1 ?v8)
             (pred_5 ?v7 ?v8)
             (pred_11 ?v10 ?v7 )
	     (pred_4 ?v7)
             (pred_10 ?v9)
             (pred_2 ?v1)
             (pred_1 ?v8)
             (pred_12 ?v7)
             (pred_8 ?v1)
             (pred_7 ?v7)
             (pred_3 ))



(:action op_2
:parameters (?v6 ?v5 ?v4 ?v11)
:precondition (and (pred_10 ?v6) (pred_10 ?v5) (pred_2 ?v4) (pred_1 ?v11)
          (pred_6 ?v6 ?v5) (pred_9 ?v4 ?v11)
                   (pred_5 ?v5 ?v11) (pred_4 ?v6) 
                   (pred_12 ?v5) (pred_8 ?v4))
:effect (and  (pred_7 ?v5) (not (pred_12 ?v5))))


(:action op_3
:parameters (?v6 ?v2)
:precondition (and (pred_10 ?v6) (pred_10 ?v2)
               (pred_4 ?v6) (pred_6 ?v6 ?v2) (pred_7 ?v2))
:effect (and (pred_4 ?v2) (not (pred_4 ?v6))))

(:action op_5
:parameters (?v6 ?v4)
:precondition (and (pred_10 ?v6) (pred_2 ?v4) 
                  (pred_4 ?v6) (pred_11 ?v4 ?v6) (pred_3 ))
:effect (and (pred_8 ?v4)
   (not (pred_11 ?v4 ?v6)) (not (pred_3 ))))


(:action op_4
:parameters (?v6 ?v12 ?v3)
:precondition (and (pred_10 ?v6) (pred_2 ?v12) (pred_2 ?v3)
                  (pred_4 ?v6) (pred_8 ?v3) (pred_11 ?v12 ?v6))
:effect (and (pred_8 ?v12) (pred_11 ?v3 ?v6)
        (not (pred_8 ?v3)) (not (pred_11 ?v12 ?v6))))

(:action op_1
:parameters (?v6 ?v4)
:precondition (and (pred_10 ?v6) (pred_2 ?v4) 
                  (pred_4 ?v6) (pred_8 ?v4))
:effect (and (pred_3 ) (pred_11 ?v4 ?v6) (not (pred_8 ?v4)))))


	

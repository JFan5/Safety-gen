(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v10 ?v8)
             (pred_1 ?v13 ?v9)
             (pred_9 ?v10 ?v9)
             (pred_4 ?v4 ?v10 )
	     (pred_3 ?v10)
             (pred_11 ?v2)
             (pred_7 ?v13)
             (pred_6 ?v9)
             (pred_5 ?v10)
             (pred_12 ?v13)
             (pred_10 ?v10)
             (pred_2 ))



(:action op_3
:parameters (?v6 ?v7 ?v12 ?v3)
:precondition (and (pred_11 ?v6) (pred_11 ?v7) (pred_7 ?v12) (pred_6 ?v3)
          (pred_8 ?v6 ?v7) (pred_1 ?v12 ?v3)
                   (pred_9 ?v7 ?v3) (pred_3 ?v6) 
                   (pred_5 ?v7) (pred_12 ?v12))
:effect (and  (pred_10 ?v7) (not (pred_5 ?v7))))


(:action op_4
:parameters (?v6 ?v11)
:precondition (and (pred_11 ?v6) (pred_11 ?v11)
               (pred_3 ?v6) (pred_8 ?v6 ?v11) (pred_10 ?v11))
:effect (and (pred_3 ?v11) (not (pred_3 ?v6))))

(:action op_1
:parameters (?v6 ?v12)
:precondition (and (pred_11 ?v6) (pred_7 ?v12) 
                  (pred_3 ?v6) (pred_4 ?v12 ?v6) (pred_2 ))
:effect (and (pred_12 ?v12)
   (not (pred_4 ?v12 ?v6)) (not (pred_2 ))))


(:action op_5
:parameters (?v6 ?v5 ?v1)
:precondition (and (pred_11 ?v6) (pred_7 ?v5) (pred_7 ?v1)
                  (pred_3 ?v6) (pred_12 ?v1) (pred_4 ?v5 ?v6))
:effect (and (pred_12 ?v5) (pred_4 ?v1 ?v6)
        (not (pred_12 ?v1)) (not (pred_4 ?v5 ?v6))))

(:action op_2
:parameters (?v6 ?v12)
:precondition (and (pred_11 ?v6) (pred_7 ?v12) 
                  (pred_3 ?v6) (pred_12 ?v12))
:effect (and (pred_2 ) (pred_4 ?v12 ?v6) (not (pred_12 ?v12)))))


	

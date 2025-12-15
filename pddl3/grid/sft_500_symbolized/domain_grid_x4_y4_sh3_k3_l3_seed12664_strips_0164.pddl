(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v12 ?v13)
             (pred_1 ?v11 ?v5)
             (pred_12 ?v12 ?v5)
             (pred_5 ?v1 ?v12 )
	     (pred_2 ?v12)
             (pred_9 ?v9)
             (pred_4 ?v11)
             (pred_10 ?v5)
             (pred_6 ?v12)
             (pred_3 ?v11)
             (pred_8 ?v12)
             (pred_7 ))



(:action op_5
:parameters (?v4 ?v3 ?v6 ?v8)
:precondition (and (pred_9 ?v4) (pred_9 ?v3) (pred_4 ?v6) (pred_10 ?v8)
          (pred_11 ?v4 ?v3) (pred_1 ?v6 ?v8)
                   (pred_12 ?v3 ?v8) (pred_2 ?v4) 
                   (pred_6 ?v3) (pred_3 ?v6))
:effect (and  (pred_8 ?v3) (not (pred_6 ?v3))))


(:action op_4
:parameters (?v4 ?v2)
:precondition (and (pred_9 ?v4) (pred_9 ?v2)
               (pred_2 ?v4) (pred_11 ?v4 ?v2) (pred_8 ?v2))
:effect (and (pred_2 ?v2) (not (pred_2 ?v4))))

(:action op_1
:parameters (?v4 ?v6)
:precondition (and (pred_9 ?v4) (pred_4 ?v6) 
                  (pred_2 ?v4) (pred_5 ?v6 ?v4) (pred_7 ))
:effect (and (pred_3 ?v6)
   (not (pred_5 ?v6 ?v4)) (not (pred_7 ))))


(:action op_3
:parameters (?v4 ?v7 ?v10)
:precondition (and (pred_9 ?v4) (pred_4 ?v7) (pred_4 ?v10)
                  (pred_2 ?v4) (pred_3 ?v10) (pred_5 ?v7 ?v4))
:effect (and (pred_3 ?v7) (pred_5 ?v10 ?v4)
        (not (pred_3 ?v10)) (not (pred_5 ?v7 ?v4))))

(:action op_2
:parameters (?v4 ?v6)
:precondition (and (pred_9 ?v4) (pred_4 ?v6) 
                  (pred_2 ?v4) (pred_3 ?v6))
:effect (and (pred_7 ) (pred_5 ?v6 ?v4) (not (pred_3 ?v6)))))


	

(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v1 ?v13)
             (pred_3 ?v8 ?v11)
             (pred_1 ?v1 ?v11)
             (pred_12 ?v9 ?v1 )
	     (pred_8 ?v1)
             (pred_5 ?v5)
             (pred_9 ?v8)
             (pred_7 ?v11)
             (pred_2 ?v1)
             (pred_10 ?v8)
             (pred_11 ?v1)
             (pred_4 ))



(:action op_5
:parameters (?v4 ?v3 ?v6 ?v10)
:precondition (and (pred_5 ?v4) (pred_5 ?v3) (pred_9 ?v6) (pred_7 ?v10)
          (pred_6 ?v4 ?v3) (pred_3 ?v6 ?v10)
                   (pred_1 ?v3 ?v10) (pred_8 ?v4) 
                   (pred_2 ?v3) (pred_10 ?v6))
:effect (and  (pred_11 ?v3) (not (pred_2 ?v3))))


(:action op_3
:parameters (?v4 ?v7)
:precondition (and (pred_5 ?v4) (pred_5 ?v7)
               (pred_8 ?v4) (pred_6 ?v4 ?v7) (pred_11 ?v7))
:effect (and (pred_8 ?v7) (not (pred_8 ?v4))))

(:action op_1
:parameters (?v4 ?v6)
:precondition (and (pred_5 ?v4) (pred_9 ?v6) 
                  (pred_8 ?v4) (pred_12 ?v6 ?v4) (pred_4 ))
:effect (and (pred_10 ?v6)
   (not (pred_12 ?v6 ?v4)) (not (pred_4 ))))


(:action op_4
:parameters (?v4 ?v12 ?v2)
:precondition (and (pred_5 ?v4) (pred_9 ?v12) (pred_9 ?v2)
                  (pred_8 ?v4) (pred_10 ?v2) (pred_12 ?v12 ?v4))
:effect (and (pred_10 ?v12) (pred_12 ?v2 ?v4)
        (not (pred_10 ?v2)) (not (pred_12 ?v12 ?v4))))

(:action op_2
:parameters (?v4 ?v6)
:precondition (and (pred_5 ?v4) (pred_9 ?v6) 
                  (pred_8 ?v4) (pred_10 ?v6))
:effect (and (pred_4 ) (pred_12 ?v6 ?v4) (not (pred_10 ?v6)))))


	

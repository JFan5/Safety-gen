(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v1 ?v9)
             (pred_1 ?v8 ?v2)
             (pred_12 ?v1 ?v2)
             (pred_6 ?v13 ?v1 )
	     (pred_9 ?v1)
             (pred_4 ?v10)
             (pred_10 ?v8)
             (pred_8 ?v2)
             (pred_2 ?v1)
             (pred_7 ?v8)
             (pred_11 ?v1)
             (pred_3 ))



(:action op_3
:parameters (?v7 ?v3 ?v5 ?v4)
:precondition (and (pred_4 ?v7) (pred_4 ?v3) (pred_10 ?v5) (pred_8 ?v4)
          (pred_5 ?v7 ?v3) (pred_1 ?v5 ?v4)
                   (pred_12 ?v3 ?v4) (pred_9 ?v7) 
                   (pred_2 ?v3) (pred_7 ?v5))
:effect (and  (pred_11 ?v3) (not (pred_2 ?v3))))


(:action op_4
:parameters (?v7 ?v11)
:precondition (and (pred_4 ?v7) (pred_4 ?v11)
               (pred_9 ?v7) (pred_5 ?v7 ?v11) (pred_11 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v7))))

(:action op_1
:parameters (?v7 ?v5)
:precondition (and (pred_4 ?v7) (pred_10 ?v5) 
                  (pred_9 ?v7) (pred_6 ?v5 ?v7) (pred_3 ))
:effect (and (pred_7 ?v5)
   (not (pred_6 ?v5 ?v7)) (not (pred_3 ))))


(:action op_5
:parameters (?v7 ?v6 ?v12)
:precondition (and (pred_4 ?v7) (pred_10 ?v6) (pred_10 ?v12)
                  (pred_9 ?v7) (pred_7 ?v12) (pred_6 ?v6 ?v7))
:effect (and (pred_7 ?v6) (pred_6 ?v12 ?v7)
        (not (pred_7 ?v12)) (not (pred_6 ?v6 ?v7))))

(:action op_2
:parameters (?v7 ?v5)
:precondition (and (pred_4 ?v7) (pred_10 ?v5) 
                  (pred_9 ?v7) (pred_7 ?v5))
:effect (and (pred_3 ) (pred_6 ?v5 ?v7) (not (pred_7 ?v5)))))


	

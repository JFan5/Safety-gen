(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v12 ?v6)
             (pred_1 ?v10 ?v8)
             (pred_9 ?v12 ?v8)
             (pred_2 ?v1 ?v12 )
	     (pred_6 ?v12)
             (pred_11 ?v9)
             (pred_5 ?v10)
             (pred_3 ?v8)
             (pred_4 ?v12)
             (pred_10 ?v10)
             (pred_12 ?v12)
             (pred_7 ))



(:action op_1
:parameters (?v5 ?v7 ?v4 ?v13)
:precondition (and (pred_11 ?v5) (pred_11 ?v7) (pred_5 ?v4) (pred_3 ?v13)
          (pred_8 ?v5 ?v7) (pred_1 ?v4 ?v13)
                   (pred_9 ?v7 ?v13) (pred_6 ?v5) 
                   (pred_4 ?v7) (pred_10 ?v4))
:effect (and  (pred_12 ?v7) (not (pred_4 ?v7))))


(:action op_4
:parameters (?v5 ?v11)
:precondition (and (pred_11 ?v5) (pred_11 ?v11)
               (pred_6 ?v5) (pred_8 ?v5 ?v11) (pred_12 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v5))))

(:action op_3
:parameters (?v5 ?v4)
:precondition (and (pred_11 ?v5) (pred_5 ?v4) 
                  (pred_6 ?v5) (pred_2 ?v4 ?v5) (pred_7 ))
:effect (and (pred_10 ?v4)
   (not (pred_2 ?v4 ?v5)) (not (pred_7 ))))


(:action op_2
:parameters (?v5 ?v3 ?v2)
:precondition (and (pred_11 ?v5) (pred_5 ?v3) (pred_5 ?v2)
                  (pred_6 ?v5) (pred_10 ?v2) (pred_2 ?v3 ?v5))
:effect (and (pred_10 ?v3) (pred_2 ?v2 ?v5)
        (not (pred_10 ?v2)) (not (pred_2 ?v3 ?v5))))

(:action op_5
:parameters (?v5 ?v4)
:precondition (and (pred_11 ?v5) (pred_5 ?v4) 
                  (pred_6 ?v5) (pred_10 ?v4))
:effect (and (pred_7 ) (pred_2 ?v4 ?v5) (not (pred_10 ?v4)))))


	

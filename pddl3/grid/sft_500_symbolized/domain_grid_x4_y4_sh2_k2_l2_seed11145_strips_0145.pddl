(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v12 ?v13)
             (pred_4 ?v10 ?v4)
             (pred_12 ?v12 ?v4)
             (pred_1 ?v9 ?v12 )
	     (pred_11 ?v12)
             (pred_7 ?v1)
             (pred_6 ?v10)
             (pred_9 ?v4)
             (pred_5 ?v12)
             (pred_8 ?v10)
             (pred_10 ?v12)
             (pred_2 ))



(:action op_1
:parameters (?v5 ?v11 ?v7 ?v2)
:precondition (and (pred_7 ?v5) (pred_7 ?v11) (pred_6 ?v7) (pred_9 ?v2)
          (pred_3 ?v5 ?v11) (pred_4 ?v7 ?v2)
                   (pred_12 ?v11 ?v2) (pred_11 ?v5) 
                   (pred_5 ?v11) (pred_8 ?v7))
:effect (and  (pred_10 ?v11) (not (pred_5 ?v11))))


(:action op_5
:parameters (?v5 ?v6)
:precondition (and (pred_7 ?v5) (pred_7 ?v6)
               (pred_11 ?v5) (pred_3 ?v5 ?v6) (pred_10 ?v6))
:effect (and (pred_11 ?v6) (not (pred_11 ?v5))))

(:action op_4
:parameters (?v5 ?v7)
:precondition (and (pred_7 ?v5) (pred_6 ?v7) 
                  (pred_11 ?v5) (pred_1 ?v7 ?v5) (pred_2 ))
:effect (and (pred_8 ?v7)
   (not (pred_1 ?v7 ?v5)) (not (pred_2 ))))


(:action op_3
:parameters (?v5 ?v3 ?v8)
:precondition (and (pred_7 ?v5) (pred_6 ?v3) (pred_6 ?v8)
                  (pred_11 ?v5) (pred_8 ?v8) (pred_1 ?v3 ?v5))
:effect (and (pred_8 ?v3) (pred_1 ?v8 ?v5)
        (not (pred_8 ?v8)) (not (pred_1 ?v3 ?v5))))

(:action op_2
:parameters (?v5 ?v7)
:precondition (and (pred_7 ?v5) (pred_6 ?v7) 
                  (pred_11 ?v5) (pred_8 ?v7))
:effect (and (pred_2 ) (pred_1 ?v7 ?v5) (not (pred_8 ?v7)))))


	

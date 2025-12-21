(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v2 ?v4)
             (pred_5 ?v7 ?v1)
             (pred_2 ?v2 ?v1)
             (pred_4 ?v10 ?v2 )
	     (pred_10 ?v2)
             (pred_8 ?v13)
             (pred_12 ?v7)
             (pred_9 ?v1)
             (pred_3 ?v2)
             (pred_1 ?v7)
             (pred_7 ?v2)
             (pred_11 ))



(:action op_2
:parameters (?v6 ?v3 ?v8 ?v9)
:precondition (and (pred_8 ?v6) (pred_8 ?v3) (pred_12 ?v8) (pred_9 ?v9)
          (pred_6 ?v6 ?v3) (pred_5 ?v8 ?v9)
                   (pred_2 ?v3 ?v9) (pred_10 ?v6) 
                   (pred_3 ?v3) (pred_1 ?v8))
:effect (and  (pred_7 ?v3) (not (pred_3 ?v3))))


(:action op_1
:parameters (?v6 ?v11)
:precondition (and (pred_8 ?v6) (pred_8 ?v11)
               (pred_10 ?v6) (pred_6 ?v6 ?v11) (pred_7 ?v11))
:effect (and (pred_10 ?v11) (not (pred_10 ?v6))))

(:action op_5
:parameters (?v6 ?v8)
:precondition (and (pred_8 ?v6) (pred_12 ?v8) 
                  (pred_10 ?v6) (pred_4 ?v8 ?v6) (pred_11 ))
:effect (and (pred_1 ?v8)
   (not (pred_4 ?v8 ?v6)) (not (pred_11 ))))


(:action op_3
:parameters (?v6 ?v12 ?v5)
:precondition (and (pred_8 ?v6) (pred_12 ?v12) (pred_12 ?v5)
                  (pred_10 ?v6) (pred_1 ?v5) (pred_4 ?v12 ?v6))
:effect (and (pred_1 ?v12) (pred_4 ?v5 ?v6)
        (not (pred_1 ?v5)) (not (pred_4 ?v12 ?v6))))

(:action op_4
:parameters (?v6 ?v8)
:precondition (and (pred_8 ?v6) (pred_12 ?v8) 
                  (pred_10 ?v6) (pred_1 ?v8))
:effect (and (pred_11 ) (pred_4 ?v8 ?v6) (not (pred_1 ?v8)))))


	

(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v5)
             (pred_8 ?v9 ?v10)
             (pred_7 ?v2 ?v10)
             (pred_1 ?v13 ?v2 )
	     (pred_4 ?v2)
             (pred_10 ?v7)
             (pred_3 ?v9)
             (pred_12 ?v10)
             (pred_6 ?v2)
             (pred_5 ?v9)
             (pred_11 ?v2)
             (pred_2 ))



(:action op_2
:parameters (?v6 ?v3 ?v4 ?v11)
:precondition (and (pred_10 ?v6) (pred_10 ?v3) (pred_3 ?v4) (pred_12 ?v11)
          (pred_9 ?v6 ?v3) (pred_8 ?v4 ?v11)
                   (pred_7 ?v3 ?v11) (pred_4 ?v6) 
                   (pred_6 ?v3) (pred_5 ?v4))
:effect (and  (pred_11 ?v3) (not (pred_6 ?v3))))


(:action op_5
:parameters (?v6 ?v8)
:precondition (and (pred_10 ?v6) (pred_10 ?v8)
               (pred_4 ?v6) (pred_9 ?v6 ?v8) (pred_11 ?v8))
:effect (and (pred_4 ?v8) (not (pred_4 ?v6))))

(:action op_4
:parameters (?v6 ?v4)
:precondition (and (pred_10 ?v6) (pred_3 ?v4) 
                  (pred_4 ?v6) (pred_1 ?v4 ?v6) (pred_2 ))
:effect (and (pred_5 ?v4)
   (not (pred_1 ?v4 ?v6)) (not (pred_2 ))))


(:action op_1
:parameters (?v6 ?v12 ?v1)
:precondition (and (pred_10 ?v6) (pred_3 ?v12) (pred_3 ?v1)
                  (pred_4 ?v6) (pred_5 ?v1) (pred_1 ?v12 ?v6))
:effect (and (pred_5 ?v12) (pred_1 ?v1 ?v6)
        (not (pred_5 ?v1)) (not (pred_1 ?v12 ?v6))))

(:action op_3
:parameters (?v6 ?v4)
:precondition (and (pred_10 ?v6) (pred_3 ?v4) 
                  (pred_4 ?v6) (pred_5 ?v4))
:effect (and (pred_2 ) (pred_1 ?v4 ?v6) (not (pred_5 ?v4)))))


	

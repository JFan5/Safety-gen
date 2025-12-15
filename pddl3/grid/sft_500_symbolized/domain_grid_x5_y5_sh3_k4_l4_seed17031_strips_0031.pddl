(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v10 ?v13)
             (pred_8 ?v12 ?v4)
             (pred_6 ?v10 ?v4)
             (pred_2 ?v1 ?v10 )
	     (pred_9 ?v10)
             (pred_10 ?v2)
             (pred_3 ?v12)
             (pred_7 ?v4)
             (pred_5 ?v10)
             (pred_11 ?v12)
             (pred_12 ?v10)
             (pred_4 ))



(:action op_1
:parameters (?v6 ?v11 ?v7 ?v9)
:precondition (and (pred_10 ?v6) (pred_10 ?v11) (pred_3 ?v7) (pred_7 ?v9)
          (pred_1 ?v6 ?v11) (pred_8 ?v7 ?v9)
                   (pred_6 ?v11 ?v9) (pred_9 ?v6) 
                   (pred_5 ?v11) (pred_11 ?v7))
:effect (and  (pred_12 ?v11) (not (pred_5 ?v11))))


(:action op_3
:parameters (?v6 ?v8)
:precondition (and (pred_10 ?v6) (pred_10 ?v8)
               (pred_9 ?v6) (pred_1 ?v6 ?v8) (pred_12 ?v8))
:effect (and (pred_9 ?v8) (not (pred_9 ?v6))))

(:action op_5
:parameters (?v6 ?v7)
:precondition (and (pred_10 ?v6) (pred_3 ?v7) 
                  (pred_9 ?v6) (pred_2 ?v7 ?v6) (pred_4 ))
:effect (and (pred_11 ?v7)
   (not (pred_2 ?v7 ?v6)) (not (pred_4 ))))


(:action op_4
:parameters (?v6 ?v3 ?v5)
:precondition (and (pred_10 ?v6) (pred_3 ?v3) (pred_3 ?v5)
                  (pred_9 ?v6) (pred_11 ?v5) (pred_2 ?v3 ?v6))
:effect (and (pred_11 ?v3) (pred_2 ?v5 ?v6)
        (not (pred_11 ?v5)) (not (pred_2 ?v3 ?v6))))

(:action op_2
:parameters (?v6 ?v7)
:precondition (and (pred_10 ?v6) (pred_3 ?v7) 
                  (pred_9 ?v6) (pred_11 ?v7))
:effect (and (pred_4 ) (pred_2 ?v7 ?v6) (not (pred_11 ?v7)))))


	

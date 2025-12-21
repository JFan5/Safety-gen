(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v13)
             (pred_9 ?v5 ?v10)
             (pred_5 ?v4 ?v10)
             (pred_6 ?v12 ?v4 )
	     (pred_10 ?v4)
             (pred_4 ?v1)
             (pred_12 ?v5)
             (pred_7 ?v10)
             (pred_11 ?v4)
             (pred_8 ?v5)
             (pred_2 ?v4)
             (pred_1 ))



(:action op_1
:parameters (?v6 ?v11 ?v8 ?v2)
:precondition (and (pred_4 ?v6) (pred_4 ?v11) (pred_12 ?v8) (pred_7 ?v2)
          (pred_3 ?v6 ?v11) (pred_9 ?v8 ?v2)
                   (pred_5 ?v11 ?v2) (pred_10 ?v6) 
                   (pred_11 ?v11) (pred_8 ?v8))
:effect (and  (pred_2 ?v11) (not (pred_11 ?v11))))


(:action op_2
:parameters (?v6 ?v7)
:precondition (and (pred_4 ?v6) (pred_4 ?v7)
               (pred_10 ?v6) (pred_3 ?v6 ?v7) (pred_2 ?v7))
:effect (and (pred_10 ?v7) (not (pred_10 ?v6))))

(:action op_4
:parameters (?v6 ?v8)
:precondition (and (pred_4 ?v6) (pred_12 ?v8) 
                  (pred_10 ?v6) (pred_6 ?v8 ?v6) (pred_1 ))
:effect (and (pred_8 ?v8)
   (not (pred_6 ?v8 ?v6)) (not (pred_1 ))))


(:action op_3
:parameters (?v6 ?v3 ?v9)
:precondition (and (pred_4 ?v6) (pred_12 ?v3) (pred_12 ?v9)
                  (pred_10 ?v6) (pred_8 ?v9) (pred_6 ?v3 ?v6))
:effect (and (pred_8 ?v3) (pred_6 ?v9 ?v6)
        (not (pred_8 ?v9)) (not (pred_6 ?v3 ?v6))))

(:action op_5
:parameters (?v6 ?v8)
:precondition (and (pred_4 ?v6) (pred_12 ?v8) 
                  (pred_10 ?v6) (pred_8 ?v8))
:effect (and (pred_1 ) (pred_6 ?v8 ?v6) (not (pred_8 ?v8)))))


	

; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 730456513 --problem-name spanner-s4-n3-l4-s730456513
(define (problem spanner-s4-n3-l4-s730456513)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_06 obj_04 obj_02 obj_01 - type_5
     obj_03 obj_11 obj_14 - type_1
     obj_08 obj_12 obj_05 obj_13 - type_3
     obj_10 obj_07 - type_3
    )
 (:init 
    (pred_3 obj_09 obj_10)
    (pred_3 obj_06 obj_08)
    (pred_1 obj_06)
    (pred_3 obj_04 obj_08)
    (pred_1 obj_04)
    (pred_3 obj_02 obj_13)
    (pred_1 obj_02)
    (pred_3 obj_01 obj_05)
    (pred_1 obj_01)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_07)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_07)
    (pred_5 obj_14)
    (pred_3 obj_14 obj_07)
    (pred_4 obj_10 obj_08)
    (pred_4 obj_13 obj_07)
    (pred_4 obj_08 obj_12)
    (pred_4 obj_12 obj_05)
    (pred_4 obj_05 obj_13)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_11)
   (pred_2 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_10)))
  )
)
)

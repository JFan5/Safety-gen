; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 730456513 --problem-name spanner-s4-n3-l4-s730456513
(define (problem spanner-s4-n3-l4-s730456513)
 (:domain spanner)
 (:objects 
     obj_14 - type_5
     obj_05 obj_01 obj_12 obj_10 - type_3
     obj_13 obj_06 obj_09 - type_1
     obj_03 obj_04 obj_11 obj_02 - type_2
     obj_08 obj_07 - type_2
    )
 (:init 
    (pred_6 obj_14 obj_08)
    (pred_6 obj_05 obj_03)
    (pred_5 obj_05)
    (pred_6 obj_01 obj_03)
    (pred_5 obj_01)
    (pred_6 obj_12 obj_02)
    (pred_5 obj_12)
    (pred_6 obj_10 obj_11)
    (pred_5 obj_10)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_07)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_07)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_07)
    (pred_3 obj_08 obj_03)
    (pred_3 obj_02 obj_07)
    (pred_3 obj_03 obj_04)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_11 obj_02)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_06)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_08)))
  )
)
)

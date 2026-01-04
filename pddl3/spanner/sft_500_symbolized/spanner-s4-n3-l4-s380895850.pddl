; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 380895850 --problem-name spanner-s4-n3-l4-s380895850
(define (problem spanner-s4-n3-l4-s380895850)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_13 obj_05 obj_12 obj_14 - type_1
     obj_10 obj_11 obj_01 - type_3
     obj_06 obj_07 obj_03 obj_02 - type_4
     obj_08 obj_04 - type_4
    )
 (:init 
    (pred_3 obj_09 obj_08)
    (pred_3 obj_13 obj_03)
    (pred_5 obj_13)
    (pred_3 obj_05 obj_03)
    (pred_5 obj_05)
    (pred_3 obj_12 obj_03)
    (pred_5 obj_12)
    (pred_3 obj_14 obj_03)
    (pred_5 obj_14)
    (pred_4 obj_10)
    (pred_3 obj_10 obj_04)
    (pred_4 obj_11)
    (pred_3 obj_11 obj_04)
    (pred_4 obj_01)
    (pred_3 obj_01 obj_04)
    (pred_1 obj_08 obj_06)
    (pred_1 obj_02 obj_04)
    (pred_1 obj_06 obj_07)
    (pred_1 obj_07 obj_03)
    (pred_1 obj_03 obj_02)
)
 (:goal
  (and
   (pred_6 obj_10)
   (pred_6 obj_11)
   (pred_6 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_01))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_08)))
  )
)
)

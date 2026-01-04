; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1045313691 --problem-name spanner-s4-n3-l4-s1045313691
(define (problem spanner-s4-n3-l4-s1045313691)
 (:domain spanner)
 (:objects 
     obj_13 - type_1
     obj_09 obj_06 obj_08 obj_10 - type_5
     obj_14 obj_03 obj_01 - type_2
     obj_05 obj_07 obj_12 obj_11 - type_4
     obj_04 obj_02 - type_4
    )
 (:init 
    (pred_5 obj_13 obj_04)
    (pred_5 obj_09 obj_12)
    (pred_1 obj_09)
    (pred_5 obj_06 obj_11)
    (pred_1 obj_06)
    (pred_5 obj_08 obj_07)
    (pred_1 obj_08)
    (pred_5 obj_10 obj_05)
    (pred_1 obj_10)
    (pred_2 obj_14)
    (pred_5 obj_14 obj_02)
    (pred_2 obj_03)
    (pred_5 obj_03 obj_02)
    (pred_2 obj_01)
    (pred_5 obj_01 obj_02)
    (pred_4 obj_04 obj_05)
    (pred_4 obj_11 obj_02)
    (pred_4 obj_05 obj_07)
    (pred_4 obj_07 obj_12)
    (pred_4 obj_12 obj_11)
)
 (:goal
  (and
   (pred_3 obj_14)
   (pred_3 obj_03)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_04)))
  )
)
)

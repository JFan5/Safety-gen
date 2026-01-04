; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1754365762 --problem-name spanner-s4-n3-l4-s1754365762
(define (problem spanner-s4-n3-l4-s1754365762)
 (:domain spanner)
 (:objects 
     obj_03 - type_3
     obj_04 obj_07 obj_13 obj_08 - type_4
     obj_14 obj_02 obj_01 - type_1
     obj_05 obj_06 obj_10 obj_12 - type_2
     obj_09 obj_11 - type_2
    )
 (:init 
    (pred_3 obj_03 obj_09)
    (pred_3 obj_04 obj_10)
    (pred_2 obj_04)
    (pred_3 obj_07 obj_06)
    (pred_2 obj_07)
    (pred_3 obj_13 obj_12)
    (pred_2 obj_13)
    (pred_3 obj_08 obj_10)
    (pred_2 obj_08)
    (pred_6 obj_14)
    (pred_3 obj_14 obj_11)
    (pred_6 obj_02)
    (pred_3 obj_02 obj_11)
    (pred_6 obj_01)
    (pred_3 obj_01 obj_11)
    (pred_4 obj_09 obj_05)
    (pred_4 obj_12 obj_11)
    (pred_4 obj_05 obj_06)
    (pred_4 obj_06 obj_10)
    (pred_4 obj_10 obj_12)
)
 (:goal
  (and
   (pred_1 obj_14)
   (pred_1 obj_02)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_09)))
  )
)
)

; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 228132619 --problem-name spanner-s4-n3-l4-s228132619
(define (problem spanner-s4-n3-l4-s228132619)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_06 obj_12 obj_08 obj_14 - type_2
     obj_02 obj_04 obj_09 - type_1
     obj_11 obj_01 obj_03 obj_13 - type_3
     obj_07 obj_05 - type_3
    )
 (:init 
    (pred_2 obj_10 obj_07)
    (pred_2 obj_06 obj_11)
    (pred_5 obj_06)
    (pred_2 obj_12 obj_13)
    (pred_5 obj_12)
    (pred_2 obj_08 obj_11)
    (pred_5 obj_08)
    (pred_2 obj_14 obj_11)
    (pred_5 obj_14)
    (pred_4 obj_02)
    (pred_2 obj_02 obj_05)
    (pred_4 obj_04)
    (pred_2 obj_04 obj_05)
    (pred_4 obj_09)
    (pred_2 obj_09 obj_05)
    (pred_1 obj_07 obj_11)
    (pred_1 obj_13 obj_05)
    (pred_1 obj_11 obj_01)
    (pred_1 obj_01 obj_03)
    (pred_1 obj_03 obj_13)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_04)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_07)))
  )
)
)

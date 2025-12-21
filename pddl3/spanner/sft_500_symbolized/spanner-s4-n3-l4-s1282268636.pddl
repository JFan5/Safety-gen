; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1282268636 --problem-name spanner-s4-n3-l4-s1282268636
(define (problem spanner-s4-n3-l4-s1282268636)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_05 obj_04 obj_02 obj_14 - type_5
     obj_07 obj_01 obj_12 - type_4
     obj_11 obj_03 obj_08 obj_10 - type_2
     obj_06 obj_09 - type_2
    )
 (:init 
    (pred_2 obj_13 obj_06)
    (pred_2 obj_05 obj_03)
    (pred_1 obj_05)
    (pred_2 obj_04 obj_08)
    (pred_1 obj_04)
    (pred_2 obj_02 obj_08)
    (pred_1 obj_02)
    (pred_2 obj_14 obj_08)
    (pred_1 obj_14)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_09)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_09)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_09)
    (pred_6 obj_06 obj_11)
    (pred_6 obj_10 obj_09)
    (pred_6 obj_11 obj_03)
    (pred_6 obj_03 obj_08)
    (pred_6 obj_08 obj_10)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_01)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_06)))
  )
)
)

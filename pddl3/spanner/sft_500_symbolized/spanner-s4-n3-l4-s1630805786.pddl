; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1630805786 --problem-name spanner-s4-n3-l4-s1630805786
(define (problem spanner-s4-n3-l4-s1630805786)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_10 obj_06 obj_12 obj_03 - type_1
     obj_04 obj_07 obj_05 - type_5
     obj_13 obj_14 obj_02 obj_01 - type_4
     obj_08 obj_11 - type_4
    )
 (:init 
    (pred_2 obj_09 obj_08)
    (pred_2 obj_10 obj_14)
    (pred_5 obj_10)
    (pred_2 obj_06 obj_02)
    (pred_5 obj_06)
    (pred_2 obj_12 obj_02)
    (pred_5 obj_12)
    (pred_2 obj_03 obj_02)
    (pred_5 obj_03)
    (pred_6 obj_04)
    (pred_2 obj_04 obj_11)
    (pred_6 obj_07)
    (pred_2 obj_07 obj_11)
    (pred_6 obj_05)
    (pred_2 obj_05 obj_11)
    (pred_4 obj_08 obj_13)
    (pred_4 obj_01 obj_11)
    (pred_4 obj_13 obj_14)
    (pred_4 obj_14 obj_02)
    (pred_4 obj_02 obj_01)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_07)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_08)))
  )
)
)

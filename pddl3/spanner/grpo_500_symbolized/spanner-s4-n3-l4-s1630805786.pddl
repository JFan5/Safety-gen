; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1630805786 --problem-name spanner-s4-n3-l4-s1630805786
(define (problem spanner-s4-n3-l4-s1630805786)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_11 obj_12 obj_04 obj_08 - type_3
     obj_07 obj_09 obj_14 - type_1
     obj_10 obj_13 obj_05 obj_03 - type_2
     obj_01 obj_06 - type_2
    )
 (:init 
    (pred_6 obj_02 obj_01)
    (pred_6 obj_11 obj_13)
    (pred_5 obj_11)
    (pred_6 obj_12 obj_05)
    (pred_5 obj_12)
    (pred_6 obj_04 obj_05)
    (pred_5 obj_04)
    (pred_6 obj_08 obj_05)
    (pred_5 obj_08)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_06)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_06)
    (pred_4 obj_14)
    (pred_6 obj_14 obj_06)
    (pred_3 obj_01 obj_10)
    (pred_3 obj_03 obj_06)
    (pred_3 obj_10 obj_13)
    (pred_3 obj_13 obj_05)
    (pred_3 obj_05 obj_03)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_09)
   (pred_1 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_01)))
  )
)
)

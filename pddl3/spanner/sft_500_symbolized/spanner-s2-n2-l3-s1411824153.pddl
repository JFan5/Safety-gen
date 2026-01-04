; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1411824153 --problem-name spanner-s2-n2-l3-s1411824153
(define (problem spanner-s2-n2-l3-s1411824153)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_10 obj_05 - type_5
     obj_08 obj_04 - type_1
     obj_01 obj_06 obj_02 - type_2
     obj_07 obj_03 - type_2
    )
 (:init 
    (pred_4 obj_09 obj_07)
    (pred_4 obj_10 obj_01)
    (pred_5 obj_10)
    (pred_4 obj_05 obj_02)
    (pred_5 obj_05)
    (pred_6 obj_08)
    (pred_4 obj_08 obj_03)
    (pred_6 obj_04)
    (pred_4 obj_04 obj_03)
    (pred_2 obj_07 obj_01)
    (pred_2 obj_02 obj_03)
    (pred_2 obj_01 obj_06)
    (pred_2 obj_06 obj_02)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_07)))
  )
)
)

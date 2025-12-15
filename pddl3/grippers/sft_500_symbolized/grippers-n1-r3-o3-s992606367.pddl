(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_3
obj_02 obj_04 - type_2
obj_07 obj_03 obj_05 - type_1
obj_01 obj_08 obj_06 - object)
(:init
(pred_3 obj_09 obj_03)
(pred_2 obj_09 obj_02)
(pred_2 obj_09 obj_04)
(pred_4 obj_01 obj_03)
(pred_4 obj_08 obj_05)
(pred_4 obj_06 obj_05)
)
(:goal
(and
(pred_4 obj_01 obj_07)
(pred_4 obj_08 obj_05)
(pred_4 obj_06 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_04))))
)
)
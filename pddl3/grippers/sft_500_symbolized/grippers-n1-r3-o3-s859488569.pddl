(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_3
obj_05 obj_07 - type_2
obj_08 obj_02 obj_04 - type_1
obj_01 obj_03 obj_06 - object)
(:init
(pred_1 obj_09 obj_04)
(pred_2 obj_09 obj_05)
(pred_2 obj_09 obj_07)
(pred_3 obj_01 obj_04)
(pred_3 obj_03 obj_08)
(pred_3 obj_06 obj_04)
)
(:goal
(and
(pred_3 obj_01 obj_08)
(pred_3 obj_03 obj_04)
(pred_3 obj_06 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_09 ?b obj_07))))
)
)
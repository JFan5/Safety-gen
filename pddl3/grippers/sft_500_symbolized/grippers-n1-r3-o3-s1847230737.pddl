(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_06 - type_2
obj_04 obj_03 - type_3
obj_07 obj_08 obj_01 - type_1
obj_02 obj_09 obj_05 - object)
(:init
(pred_4 obj_06 obj_07)
(pred_3 obj_06 obj_04)
(pred_3 obj_06 obj_03)
(pred_2 obj_02 obj_07)
(pred_2 obj_09 obj_08)
(pred_2 obj_05 obj_08)
)
(:goal
(and
(pred_2 obj_02 obj_08)
(pred_2 obj_09 obj_01)
(pred_2 obj_05 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_06 ?b obj_03))))
)
)
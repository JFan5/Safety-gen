(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_05 obj_08 - type_2
obj_01 obj_07 obj_04 - type_3
obj_06 obj_09 obj_03 - object)
(:init
(pred_1 obj_02 obj_04)
(pred_3 obj_02 obj_05)
(pred_3 obj_02 obj_08)
(pred_2 obj_06 obj_04)
(pred_2 obj_09 obj_01)
(pred_2 obj_03 obj_01)
)
(:goal
(and
(pred_2 obj_06 obj_07)
(pred_2 obj_09 obj_01)
(pred_2 obj_03 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_02 ?b obj_08))))
)
)
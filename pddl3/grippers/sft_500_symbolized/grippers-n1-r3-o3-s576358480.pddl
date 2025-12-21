(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_08 obj_06 - type_2
obj_01 obj_07 obj_03 - type_3
obj_04 obj_05 obj_02 - object)
(:init
(pred_1 obj_09 obj_01)
(pred_3 obj_09 obj_08)
(pred_3 obj_09 obj_06)
(pred_2 obj_04 obj_03)
(pred_2 obj_05 obj_07)
(pred_2 obj_02 obj_03)
)
(:goal
(and
(pred_2 obj_04 obj_07)
(pred_2 obj_05 obj_01)
(pred_2 obj_02 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_09 ?b obj_06))))
)
)
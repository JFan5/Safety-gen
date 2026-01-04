(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_3
obj_06 obj_08 - type_2
obj_01 obj_07 obj_05 - type_1
obj_02 obj_04 obj_03 - object)
(:init
(pred_2 obj_09 obj_01)
(pred_3 obj_09 obj_06)
(pred_3 obj_09 obj_08)
(pred_4 obj_02 obj_07)
(pred_4 obj_04 obj_07)
(pred_4 obj_03 obj_01)
)
(:goal
(and
(pred_4 obj_02 obj_07)
(pred_4 obj_04 obj_01)
(pred_4 obj_03 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_06))))
)
)
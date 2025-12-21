(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_05 obj_06 - type_2
obj_04 obj_01 obj_03 obj_10 - type_3
obj_02 obj_07 obj_08 - object)
(:init
(pred_1 obj_09 obj_04)
(pred_3 obj_09 obj_05)
(pred_3 obj_09 obj_06)
(pred_2 obj_02 obj_01)
(pred_2 obj_07 obj_01)
(pred_2 obj_08 obj_01)
)
(:goal
(and
(pred_2 obj_02 obj_03)
(pred_2 obj_07 obj_01)
(pred_2 obj_08 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_09 ?b obj_06))))
)
)
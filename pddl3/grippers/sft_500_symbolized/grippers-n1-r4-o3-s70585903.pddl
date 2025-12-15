(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_04 obj_06 - type_2
obj_10 obj_01 obj_03 obj_07 - type_3
obj_02 obj_05 obj_09 - object)
(:init
(pred_3 obj_08 obj_03)
(pred_1 obj_08 obj_04)
(pred_1 obj_08 obj_06)
(pred_4 obj_02 obj_01)
(pred_4 obj_05 obj_03)
(pred_4 obj_09 obj_01)
)
(:goal
(and
(pred_4 obj_02 obj_07)
(pred_4 obj_05 obj_10)
(pred_4 obj_09 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_08 ?b obj_06))))
)
)
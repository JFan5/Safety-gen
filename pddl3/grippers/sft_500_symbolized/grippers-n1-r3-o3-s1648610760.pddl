(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_02 - type_2
obj_04 obj_06 - type_3
obj_03 obj_01 obj_07 - type_1
obj_08 obj_09 obj_05 - object)
(:init
(pred_1 obj_02 obj_01)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_06)
(pred_4 obj_08 obj_01)
(pred_4 obj_09 obj_01)
(pred_4 obj_05 obj_03)
)
(:goal
(and
(pred_4 obj_08 obj_01)
(pred_4 obj_09 obj_01)
(pred_4 obj_05 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_02 ?b obj_06))))
)
)
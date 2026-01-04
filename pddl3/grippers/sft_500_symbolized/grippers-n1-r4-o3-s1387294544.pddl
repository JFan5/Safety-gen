(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_3
obj_09 obj_10 - type_1
obj_05 obj_06 obj_01 obj_04 - type_2
obj_03 obj_02 obj_07 - object)
(:init
(pred_4 obj_08 obj_01)
(pred_1 obj_08 obj_09)
(pred_1 obj_08 obj_10)
(pred_3 obj_03 obj_05)
(pred_3 obj_02 obj_06)
(pred_3 obj_07 obj_01)
)
(:goal
(and
(pred_3 obj_03 obj_04)
(pred_3 obj_02 obj_01)
(pred_3 obj_07 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_08 ?b obj_10))))
)
)
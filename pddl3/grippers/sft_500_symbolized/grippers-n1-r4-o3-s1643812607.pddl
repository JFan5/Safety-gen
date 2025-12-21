(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_01 obj_10 - type_2
obj_06 obj_04 obj_07 obj_03 - type_3
obj_05 obj_09 obj_08 - object)
(:init
(pred_1 obj_02 obj_03)
(pred_3 obj_02 obj_01)
(pred_3 obj_02 obj_10)
(pred_2 obj_05 obj_03)
(pred_2 obj_09 obj_03)
(pred_2 obj_08 obj_03)
)
(:goal
(and
(pred_2 obj_05 obj_03)
(pred_2 obj_09 obj_03)
(pred_2 obj_08 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_02 ?b obj_10))))
)
)
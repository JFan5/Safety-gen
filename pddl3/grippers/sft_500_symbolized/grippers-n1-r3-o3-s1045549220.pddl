(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_08 - type_2
obj_06 obj_05 - type_3
obj_04 obj_01 obj_03 - type_1
obj_09 obj_07 obj_02 - object)
(:init
(pred_3 obj_08 obj_01)
(pred_1 obj_08 obj_06)
(pred_1 obj_08 obj_05)
(pred_4 obj_09 obj_03)
(pred_4 obj_07 obj_03)
(pred_4 obj_02 obj_04)
)
(:goal
(and
(pred_4 obj_09 obj_04)
(pred_4 obj_07 obj_03)
(pred_4 obj_02 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_08 ?b obj_05))))
)
)
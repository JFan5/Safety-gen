(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_09 obj_05 - type_2
obj_06 obj_03 obj_10 obj_04 - type_3
obj_08 obj_01 obj_07 - object)
(:init
(pred_1 obj_02 obj_10)
(pred_3 obj_02 obj_09)
(pred_3 obj_02 obj_05)
(pred_4 obj_08 obj_10)
(pred_4 obj_01 obj_06)
(pred_4 obj_07 obj_06)
)
(:goal
(and
(pred_4 obj_08 obj_04)
(pred_4 obj_01 obj_03)
(pred_4 obj_07 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_02 ?b obj_05))))
)
)
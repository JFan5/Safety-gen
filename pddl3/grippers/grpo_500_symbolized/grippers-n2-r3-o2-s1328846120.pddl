(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_08 obj_10 - type_1
obj_11 obj_02 obj_09 obj_03 - type_3
obj_06 obj_07 obj_01 - type_2
obj_05 obj_04 - object)
(:init
(pred_3 obj_08 obj_01)
(pred_4 obj_08 obj_11)
(pred_4 obj_08 obj_02)
(pred_3 obj_10 obj_06)
(pred_4 obj_10 obj_09)
(pred_4 obj_10 obj_03)
(pred_2 obj_05 obj_01)
(pred_2 obj_04 obj_06)
)
(:goal
(and
(pred_2 obj_05 obj_01)
(pred_2 obj_04 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_01) (pred_3 obj_10 obj_01))))
  )
)
)